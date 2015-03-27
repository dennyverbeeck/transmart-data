--
-- Name: de_subject_rna_data; Type: TABLE; Schema: deapp; Owner: -
--
CREATE TABLE de_subject_rna_data (
    trial_source character varying(200),
    trial_name character varying(50),
    probeset_id character varying(200) NOT NULL,
    assay_id bigint NOT NULL,
    patient_id bigint,
    raw_intensity double precision,
    log_intensity double precision,
    zscore double precision,
    partition_id numeric
);

--
-- Name: de_subject_rna_data_pk; Type: CONSTRAINT; Schema: deapp; Owner: -
--
ALTER TABLE ONLY de_subject_rna_data
    ADD CONSTRAINT de_subject_rna_data_pk PRIMARY KEY (assay_id, probeset_id);

--
-- Name: idx_de_rna_data_1; Type: INDEX; Schema: deapp; Owner: -
--
CREATE INDEX idx_de_rna_data_1 ON de_subject_rna_data USING btree (trial_name, assay_id, probeset_id);

--
-- Name: idx_de_rna_data_2; Type: INDEX; Schema: deapp; Owner: -
--
CREATE INDEX idx_de_rna_data_2 ON de_subject_rna_data USING btree (assay_id, probeset_id);

--
-- Name: de_subject_rna_data_assay_id_fk; Type: FK CONSTRAINT; Schema: deapp; Owner: -
--
ALTER TABLE ONLY de_subject_rna_data
    ADD CONSTRAINT de_subject_rna_data_assay_id_fk FOREIGN KEY (assay_id) REFERENCES de_subject_sample_mapping(assay_id) ON DELETE CASCADE;

--
-- Name: de_subject_rna_data_probeset_id_fk; Type: FK CONSTRAINT; Schema: deapp; Owner: -
--
ALTER TABLE ONLY de_subject_rna_data
    ADD CONSTRAINT de_subject_rna_data_probeset_id_fk FOREIGN KEY (probeset_id) REFERENCES de_rnaseq_annotation(transcript_id);

