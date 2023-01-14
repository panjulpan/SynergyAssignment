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
      <Stack.Screen name="Page 1" component={PageOneScreen} />
      <Stack.Screen name="Page 2" component={PageTwoScreen} />
      <Stack.Screen name="Page 3" component={PageThreeScreen} />
      <Stack.Screen name="Page 4" component={PageFourScreen} />
    </Stack.Navigator>
  );
};

export default StackNavigation;
