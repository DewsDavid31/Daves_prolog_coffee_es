% Author: David Dews
:- dynamic fact/2.
:- retractall(fact(_,_)).
is_true(Q) :- (fact(Q,no) ->false ; (fact(Q,yes) -> true ; (format('~w?~n',[Q]),read(X),assert(fact(Q,X)),is_true(Q)))).

% my coffee knowledge taken from tasteofhome.com
coffee(black) :- is_true('has brew coffee'),is_true('has nothing else but coffee').
coffee(latte) :- is_true('has espresso'),is_true('has steamed milk').
coffee(cappuccino) :- is_true('has espresso'),is_true('has steamed milk'),is_true('has foam').
coffee(americano) :- is_true('has espresso'),is_true('has hot water').
coffee(espresso) :- is_true('has espresso'),is_true('is in a 1oz glass').
coffee(doppio) :- is_true('has espresso'),is_true('is in a 2oz glass').
coffee(cortado) :- is_true('has espresso'),is_true('has steamed milk'),is_true('is in a 2oz glass').
coffee('red eye') :- is_true('has brew coffee'),is_true('has espresso').
coffee(galao) :- is_true('has espresso'),is_true('has foam'),is_true('is in a large cup').
coffee(lungo) :- is_true('has espresso'),is_true('is in a large cup').
coffee(macchiato) :- is_true('has espresso'),is_true('has foam').
coffee(mocha) :- is_true('has espresso'),is_true('has steamed milk'),is_true('has chocolate(aww yeah)').
coffee(ristretto) :- is_true('has espresso'),is_true('has a smaller amount than cup needs').
coffee('flat white') :- is_true('has espresso'),is_true('has steamed milk').
coffee(affogato) :- is_true('has espresso'),is_true('has ice cream(yay)').
coffee('cafe au lait') :- is_true('has brew coffee'),is_true('has steamed milk').
coffee(irish) :- is_true('has brew coffee'),is_true('has whiskey and dont lie'),is_true('has cream').
 

% ugly as sin if/else tree for prompting
begin :- retractall(fact(_,_)),format('Welcome to the ES about Coffee!~n',[]), format('I am going to ask you questions about your coffees features.~n',[]),format('Please answer yes. or no.~n',[]),write('Ready? '),(read(yes) ->(
coffee(A) ->(
 format('I think your coffee is a ~w~n Did I do allright? ', [A]),(read(yes) -> (
format('NICE, SIP TO PERFECTION!~nTo try again, just type begin.~n',[])) ; format('OOPS, maybe i havent had enough coffee!~nTo try again just type begin.',[])
)
); format('Hmmm... I dont know that one, maybe I need more coffee...~nTo try again, just type begin.~n',[]))
 ; begin).
