%the cat was bitten by the dog
%the shoe was bitten by the dog
%the cat bit the dog
%the man was bitten by the dog
%Then the cat killed the dog

%The cat bit the dog. The cat killed the dog.
 sent_of_par(1,p,s2).
 sent_of_par(2,p,s4).


sentence(s).
word(1, s, "the"). word(2, s, "cat").
word(3, s, "was"). word(4, s,"bitten").
word(5, s, "by"). word(6, s, "the"). word(7, s, "dog").

sentence(s1)
word(1, s1, "the"). word(2, s1, "shoe").
word(3, s1, "was"). word(4, s1,"bitten").
word(5, s1, "by"). word(6, s1, "the"). word(7, s1, "dog").

sentence(s2).
word(1, s2, "the"). word(2, s2, "cat").
word(3, s2, "bit"). word(4, s2,"the").
word(5, s2, "dog").

sentence(s3).
word(1, s3, "the"). word(2, s3, "man").
word(3, s3, "was"). word(4, s3,"bitten").
word(5, s3, "by"). word(6, s3, "the"). word(7, s3, "dog").

sentence(s4).
word(1, s4, "then"). word(2,s4,"the"),word(3, s4, "cat").
word(4, s4, "killed"). word(5, s4,"the").
word(6, s4, "dog").

pos("the",s,1).pos("cat",s,2).pos("was",s,3).pos("bitten",s,4).pos("by",s,5).pos("the",s,6).pos("dog",s,7).
pos("the",s1,1).pos("shoe",s1,2).pos("was",s1,3).pos("bitten",s1,4).pos("by",s1,5).pos("the",s1,6).pos("dog",s1,7).
pos("the",s2,1).pos("cat",s2,2).pos("bit",s2,3).pos("the",s2,4).pos("dog",s2,5).
pos("the",s3,1).pos("man",s3,2).pos("was",s3,3).pos("bitten",s3,4).pos("by",s3,5).pos("the",s3,6).pos("dog",s3,7).
pos("the",s4,1).pos("cat",s4,2).pos("killed",s4,3).pos("the",s4,4).pos("dog",s4,5).




is_subclass(entities,concepts).
is_subclass(actions,concepts).
is_subclass(semantic_notions,concepts).
is_sublcass(living_entitites,entities).
is_sublcass(nonliving_entitites,entities).
is_sublcass(animate_agent_actions,actions).
is_sublcass(animals,living_entitites).
is_sublcass(humans,animals).
is_sublcass(canines,animals).
is_sublcass(felines,animals).
is_subclass(children,humans).
is_subclass(adults,humans).
is_sublcass(motion_actions,animate_agent_actions).
is_sublcass(tooth_req_actions,animate_agent_actions).
is_sublcass(violent_actions,animate_agent_actions).

is_subclass(content_words,words).
is_subclass(forms,words).
is_subclass(nouns,content_words).
is_subclass(verbs,content_words).
is_subclass(m_forms).
is_subclass(nm_forms).
is_subclass(common_nouns,nouns).
is_subclass(proper_nouns,nouns).
is_subclass(nr_m_forms,m_forms).
is_subclass(r_m_forms,m_forms).



is_a(dogs,canines).
is_a(dog,canines).
is_a(cat,felines).
is_a(bitten,tooth_req_actions).
%is_a(bitten,violent_actions).
is_a(shoe,nonliving_entities).
is_a(bit,tooth_req_actions).
is_a(man,humans).
is_a(killed,violent_actions).
is_a(kill,violent_actions).



is_a("the",nr_m_forms).
is_a("cat",common_nouns).
is_a("was",r_m_forms).
is_a("bitten",nr_m_forms).
is_a("by",r_m_forms).
is_a("dog",common_nouns).
is_a("bitten",verbs).
is_a("was,nr_m_forms").
is_a("shoe",common_nouns).
is_a("bite",verbs).
is_a("bit",verbs).
is_a("bitten",nr_m_forms).
is_a("man",common_nouns).
is_a("killed",verbs).
is_a("killed",nr_m_forms).


has_meaning("cat",common_nouns,cat).
has_meaning("man",common_nouns,man).
has_meaning("shoe",common_nouns,shoe).
has_meaning("dog", common_nouns, dog).
has_meaning("bitten", verbs, bite).
has_meaning("bitten", nr_m_forms, past_participle).
has_meaning("bit", verbs, bite).
has_meaning("bit", nr_m_forms, past_participle).
has_meaning("killed", verbs, kill).
has_meaning("killed", nr_m_forms, past_participle).

ev(bite, cat, dog).
ev(bite, shoe, dog).
ev(bite, man, dog).
ev(kill,cat,dog).

alive(cat).
alive(dog).
alive(man).

can_move(cat).
can_move(dog).
can_move(man).
can_bite(dog).
can_bite(cat).


not holds(alive(E), I + 1):- occurs(ev(kill,E1,E), I).
not holds(can move(E),I):-  holds(alive(E), I).

occurs(Ev,I):-impossible(Ev, I).
impossible(ev(A,E1,E2),I):-inst(A,animate_agent_actions),not inst(E1,living_entities).
impossible(ev(A,E1,E2),I):- inst(A,animate_agent_actions),not holds(alive(E1),I).
impossible(ev(A,E1,E2),I):-inst(A,tooth_req_actions),not has_teeth(E1).
 

 is_ml_ctg(content_words, forms).
 is_ml_ctg(m_forms,nm_forms).
 is_ml_ctg(nr_m_forms,r_m_forms).
 is_ml_pos(intial,final).
 is_ml_pos(final,medial).


 ml_word(K1,S,Ctg1,K2,Ctg2):- leaf_ctg(Ctg1),leaf_ctg(Ctg2),word(K1,S,W1),is_a(W1,Ctg1),word(K2,S,W2),is_a(W2,Ctg2),ml_ctg(Ctg1,Ctg2).
 ml_word(K1,S,Ctg,K2,Ctg):- leaf_ctg(Ctg), word(K1,S,W1),is_a(W1,Ctg1),word(K2,S,W2),is_a(W2,Ctg2),pos(K1,S,Pos1),pos(K2,S,Pos2),ml_pos(Pos1,Pos2).

map(K,S,Ctg,C):-word(K,S,W),is_a(W,Ctg),leaf_ctg(Ctg),has_meaning(W,Ctg,C),enough_resources_available(K,S,Ctg),not ab(dmap(K,S,Ctg,C)).

resources_consumed(N,K,S,Ctg):- word(K,S,W),in(W,Ctg),leaf_ctg(Ctg),N= #count{ml_wrd(K1,S,Ctg1,K,Ctg)L leaf_ctg(Ctg1)}.

enough_resources_available(K,S,Ctg):- resources_consumed(N1,K,S,Ctg),resources_consumed_sent(N2,S,Ctg), resources_required(N3,K,S,Ctg), resource_capacity(N),N-N1-N2>=N3.

ab(dmap(K,S,Ctg,C)) or not(ab(dmap(K,S,Ctg,C))):- word(K,S,W),has_meaning(W,Ctg,C),word(K1,S,W1),K != K1, W!=W1,map(K1,S,Ctg1,C).


extr_m(Dir,S,Fnp):- not extr_m(Rev,S,fnp),dir_rev_m(Dir,Rev,S).
extr_m(Rev,S,fnp):- impossible(Dir,I),not impossible(Rev,I), dir_rev_m(Dir,Rv,S),sent_of_par(I,P,S).

extr_m(Rev,S,fnp):- not impossible(Dir,I),unlikely(Dir,I),not hpd(Dir),
not impossible(Rev,I), not unlikely(Rev,I), dir_rev_m(Dir,Rev,S), sent_of_par(I,P,S).

extr_m(Rev,S,fnp):- hpd(Rev),dir_rev_m(Dir,Rev,S),sent_of_par(I,P,S).
extr_m(Ev,S):- extr_m(Ev,S,grm_cues).
extr_m(Ev,S):- extr_m(Ev,S,fnp),not extr_m_by(Ev,S,grm_cues).
extr_m_by(S,X):- extr_m(Ev,S,X).

occurs(Ev,I):- extr_m(Ev,S),sent_of_par(I,P,S).