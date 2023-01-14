import {NavigationContainer} from '@react-navigation/native';
import React from 'react';
import linking from './src/config/linking';
import StackNavigation from './src/navigation/StackNavigation';

const App = () => {
  return (
    <NavigationContainer linking={linking}>
      <StackNavigation />
    </NavigationContainer>
  );
};

export default App;
