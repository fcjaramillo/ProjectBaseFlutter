-- William Campiño Campaign Website Database Schema
-- Run this in Supabase SQL Editor

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Candidate Info
CREATE TABLE IF NOT EXISTS candidate_info (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    slogan VARCHAR(500),
    biography TEXT,
    values TEXT[],
    image_url TEXT,
    video_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Life Milestones (Timeline)
CREATE TABLE IF NOT EXISTS life_milestones (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    year INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    image_url TEXT,
    category VARCHAR(50) CHECK (category IN ('personal', 'profesional', 'politico', 'academico')),
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- City Vision
CREATE TABLE IF NOT EXISTS city_vision (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    main_message TEXT NOT NULL,
    principles TEXT[],
    image_url TEXT,
    video_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Strategic Axes
CREATE TABLE IF NOT EXISTS strategic_axes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    icon VARCHAR(100),
    color VARCHAR(7),
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Proposals
CREATE TABLE IF NOT EXISTS proposals (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    axis_id UUID REFERENCES strategic_axes(id) ON DELETE SET NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(100),
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Endorsements
CREATE TABLE IF NOT EXISTS endorsements (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    title VARCHAR(255),
    quote TEXT,
    image_url TEXT,
    organization VARCHAR(255),
    type VARCHAR(50) CHECK (type IN ('personal', 'organizacion', 'politico', 'empresarial')),
    is_featured BOOLEAN DEFAULT FALSE,
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Events/Agenda
CREATE TABLE IF NOT EXISTS events (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    event_date DATE NOT NULL,
    event_time TIME,
    location VARCHAR(500),
    address TEXT,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    livestream_url TEXT,
    image_url TEXT,
    is_featured BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- News
CREATE TABLE IF NOT EXISTS news (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(255) NOT NULL,
    summary TEXT,
    content TEXT,
    image_url TEXT,
    source_name VARCHAR(255),
    source_url TEXT,
    published_date DATE DEFAULT CURRENT_DATE,
    category VARCHAR(100),
    is_featured BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Media Gallery
CREATE TABLE IF NOT EXISTS media (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(255),
    type VARCHAR(20) CHECK (type IN ('image', 'video', 'document')),
    url TEXT NOT NULL,
    thumbnail_url TEXT,
    description TEXT,
    media_date DATE,
    category VARCHAR(100),
    is_featured BOOLEAN DEFAULT FALSE,
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Volunteers
CREATE TABLE IF NOT EXISTS volunteers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    commune VARCHAR(100),
    neighborhood VARCHAR(255),
    skills TEXT[],
    availability TEXT,
    message TEXT,
    is_contacted BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Contacts
CREATE TABLE IF NOT EXISTS contacts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    subject VARCHAR(255),
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Communes/Territory
CREATE TABLE IF NOT EXISTS communes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    number INTEGER,
    description TEXT,
    population INTEGER,
    neighborhoods TEXT[],
    svg_path TEXT,
    color VARCHAR(7),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Proposals by Commune
CREATE TABLE IF NOT EXISTS commune_proposals (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    commune_id UUID REFERENCES communes(id) ON DELETE CASCADE,
    proposal_id UUID REFERENCES proposals(id) ON DELETE CASCADE,
    specific_details TEXT,
    priority INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(commune_id, proposal_id)
);

-- Social Links
CREATE TABLE IF NOT EXISTS social_links (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    platform VARCHAR(50) NOT NULL,
    url TEXT NOT NULL,
    icon VARCHAR(100),
    sort_order INTEGER DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Site Configuration
CREATE TABLE IF NOT EXISTS site_config (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    key VARCHAR(100) UNIQUE NOT NULL,
    value TEXT,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Investment Projects (Citizen Calculator)
CREATE TABLE IF NOT EXISTS investment_projects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    unit_cost BIGINT NOT NULL,
    unit_name VARCHAR(100),
    icon VARCHAR(100),
    category VARCHAR(100),
    max_quantity INTEGER DEFAULT 100,
    sort_order INTEGER DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Citizen Investments (Sessions)
CREATE TABLE IF NOT EXISTS citizen_investments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    session_id VARCHAR(255) NOT NULL,
    total_budget BIGINT DEFAULT 830000000000,
    total_invested BIGINT DEFAULT 0,
    ip_address VARCHAR(45),
    user_agent TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Citizen Investment Items
CREATE TABLE IF NOT EXISTS citizen_investment_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    investment_id UUID REFERENCES citizen_investments(id) ON DELETE CASCADE,
    project_id UUID REFERENCES investment_projects(id) ON DELETE CASCADE,
    quantity INTEGER NOT NULL DEFAULT 1,
    subtotal BIGINT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_life_milestones_year ON life_milestones(year);
CREATE INDEX IF NOT EXISTS idx_life_milestones_category ON life_milestones(category);
CREATE INDEX IF NOT EXISTS idx_proposals_axis_id ON proposals(axis_id);
CREATE INDEX IF NOT EXISTS idx_proposals_category ON proposals(category);
CREATE INDEX IF NOT EXISTS idx_events_date ON events(event_date);
CREATE INDEX IF NOT EXISTS idx_events_featured ON events(is_featured);
CREATE INDEX IF NOT EXISTS idx_news_date ON news(published_date);
CREATE INDEX IF NOT EXISTS idx_news_featured ON news(is_featured);
CREATE INDEX IF NOT EXISTS idx_news_category ON news(category);
CREATE INDEX IF NOT EXISTS idx_media_type ON media(type);
CREATE INDEX IF NOT EXISTS idx_media_category ON media(category);
CREATE INDEX IF NOT EXISTS idx_volunteers_commune ON volunteers(commune);
CREATE INDEX IF NOT EXISTS idx_commune_proposals_commune ON commune_proposals(commune_id);
CREATE INDEX IF NOT EXISTS idx_investment_items_investment ON citizen_investment_items(investment_id);

-- Enable Row Level Security (RLS)
ALTER TABLE candidate_info ENABLE ROW LEVEL SECURITY;
ALTER TABLE life_milestones ENABLE ROW LEVEL SECURITY;
ALTER TABLE city_vision ENABLE ROW LEVEL SECURITY;
ALTER TABLE strategic_axes ENABLE ROW LEVEL SECURITY;
ALTER TABLE proposals ENABLE ROW LEVEL SECURITY;
ALTER TABLE endorsements ENABLE ROW LEVEL SECURITY;
ALTER TABLE events ENABLE ROW LEVEL SECURITY;
ALTER TABLE news ENABLE ROW LEVEL SECURITY;
ALTER TABLE media ENABLE ROW LEVEL SECURITY;
ALTER TABLE volunteers ENABLE ROW LEVEL SECURITY;
ALTER TABLE contacts ENABLE ROW LEVEL SECURITY;
ALTER TABLE communes ENABLE ROW LEVEL SECURITY;
ALTER TABLE commune_proposals ENABLE ROW LEVEL SECURITY;
ALTER TABLE social_links ENABLE ROW LEVEL SECURITY;
ALTER TABLE site_config ENABLE ROW LEVEL SECURITY;
ALTER TABLE investment_projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE citizen_investments ENABLE ROW LEVEL SECURITY;
ALTER TABLE citizen_investment_items ENABLE ROW LEVEL SECURITY;

-- Create RLS policies for public read access
CREATE POLICY "Public read access" ON candidate_info FOR SELECT USING (true);
CREATE POLICY "Public read access" ON life_milestones FOR SELECT USING (true);
CREATE POLICY "Public read access" ON city_vision FOR SELECT USING (true);
CREATE POLICY "Public read access" ON strategic_axes FOR SELECT USING (true);
CREATE POLICY "Public read access" ON proposals FOR SELECT USING (true);
CREATE POLICY "Public read access" ON endorsements FOR SELECT USING (true);
CREATE POLICY "Public read access" ON events FOR SELECT USING (is_active = true);
CREATE POLICY "Public read access" ON news FOR SELECT USING (is_active = true);
CREATE POLICY "Public read access" ON media FOR SELECT USING (true);
CREATE POLICY "Public read access" ON communes FOR SELECT USING (true);
CREATE POLICY "Public read access" ON commune_proposals FOR SELECT USING (true);
CREATE POLICY "Public read access" ON social_links FOR SELECT USING (is_active = true);
CREATE POLICY "Public read access" ON site_config FOR SELECT USING (true);
CREATE POLICY "Public read access" ON investment_projects FOR SELECT USING (is_active = true);

-- Allow public to insert volunteers and contacts
CREATE POLICY "Public insert access" ON volunteers FOR INSERT WITH CHECK (true);
CREATE POLICY "Public insert access" ON contacts FOR INSERT WITH CHECK (true);
CREATE POLICY "Public insert access" ON citizen_investments FOR INSERT WITH CHECK (true);
CREATE POLICY "Public insert access" ON citizen_investment_items FOR INSERT WITH CHECK (true);
