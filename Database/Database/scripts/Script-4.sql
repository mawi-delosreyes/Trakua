SELECT DISTINCT t.transaction_id, t.envelope_id, e.envelope_name, t.sub_envelope_id, se.sub_envelope_name, 
t.transaction_date, t.transaction_amount, t.notes, t.transaction_type, t.account_id, t.from_envelope_id, t.is_transfer, 
t.from_sub_envelope_id FROM Transactions t 
INNER JOIN Envelopes e ON t.envelope_id=e.envelope_id 
INNER JOIN Sub_Envelopes se ON t.sub_envelope_id=se.sub_envelope_id
WHERE t.transaction_date<=1725724800000 ORDER BY t.transaction_date LIMIT 10