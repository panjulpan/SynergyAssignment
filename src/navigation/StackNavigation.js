import React from 'react';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import {
  HomeScreen,
  PageFourScreen,
  PageOneScreen,
  PageThreeScreen,
  PageTwoScreen,
} from '../screen';

const Stack = createNativeStackNavigator();

const StackNavigation = () => {
  return (
    <Stack.Navigator>
      <Stack.Screen name="Home" component={HomeScreen} />
      <Stack.Screen name="Mercury" component={PageOneScreen} />
      <Stack.Screen name="Mars" component={PageTwoScreen} />
      <Stack.Screen name="Jupiter" component={PageThreeScreen} />
      <Stack.Screen name="Uranus" component={PageFourScreen} />
    </Stack.Navigator>
  );
};

export default StackNavigation;
