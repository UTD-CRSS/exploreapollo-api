DO $$

DECLARE Apollo11Id integer;

BEGIN
INSERT INTO missions (name, title, met_start_time) VALUES
('Apollo11', 'Apollo 11', '1969-07-16 13:32:00+01') RETURNING id into Apollo11Id;

INSERT INTO channels (mission, title, name, description) VALUES
(Apollo11Id, 'Flight Director', 'FLIGHT', 'Responsible for overall Shuttle mission and payload operations'),
(Apollo11Id, 'Spacecraft Communicator', 'CAPCOM', 'Communications link between flight control and astronauts. Acronym was created when spacecraft were referred to as "capsules.'),
(Apollo11Id, 'Flight Dynamics Officer', 'FDO', 'Pronounced "fido" -- plans maneuvers and monitors trajectory'),
(Apollo11Id, 'Guidance Procedures Officer', 'GPO', 'Monitors onboard navigation and guidance computer software'),
(Apollo11Id, 'Data Processing System (Engineer)', 'DPS', 'Monitors the data processing system of computers'),
(Apollo11Id, 'Surgeon', 'Surgeon', 'A medical doctor on staff'),
(Apollo11Id, 'Booster Engineer', 'Booster', 'Monitors the main engine, Solid Rocket Boosters and External Tank from pre-launch to ascent phases of missions'),
(Apollo11Id, 'Payload Deploy Retrieval System', 'PDRS', 'Monitors operation of the remote manipulator system'),
(Apollo11Id, 'Propulsion Engineer', 'PROP', 'Monitors reaction control and orbital maneuvering propellants'),
(Apollo11Id, 'Guidance, Navigation and Controls System Engineer', 'GNC', 'Monitors vehicle guidance and navigation systems'),
(Apollo11Id, 'Electrical, Environmental and Consumables Manager', 'EECOM', 'Responsible for passive and active thermal controls of the vehicle, cabin atmosphere, supply systems and fire detection'),
(Apollo11Id, 'Electrical Generation and Illumination Engineer', 'EGIL', 'Monitors electrical systems'),
(Apollo11Id, 'Instrumentation and Communications Officer', 'INCO', 'Monitors in-flight communications and instrumentation systems'),
(Apollo11Id, 'Russian Interface Operator', 'RIO', 'Liaison between U.S. and Russian Control teams'),
(Apollo11Id, 'Ground Controller', 'GC', 'Responsible for telemetry and command in the MCC and directs maintenance and operation activities'),
(Apollo11Id, 'Flight Activities Officer', 'FAO', 'Plans crew activities'),
(Apollo11Id, 'Payloads Officer', 'PAYLOAD', 'Coordinates activities involving the payload'),
(Apollo11Id, 'Maintenance, Mechanical, Arm and Crew Systems', 'MMACS', 'Monitors the Orbiter''s structural and mechanical system'),
(Apollo11Id, 'Public Affairs Officer', 'PAO', 'Provides commentary and mission information to the media and public'),
(Apollo11Id, 'Mission Operations Directorate Manager', 'MOD', 'Link from the Flight Control Room to top NASA and JSC mission operations directorate management');

END $$;
