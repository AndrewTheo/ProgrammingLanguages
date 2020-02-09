reachable(StartState, FinalState, []) :-
    StartState=FinalState.
reachable(StartState, FinalState, [H | T]) :-
    transition(StartState, FinalState, [H | T]), reachable(H, FinalState, T).
